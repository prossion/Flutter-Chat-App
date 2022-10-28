import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/storage_provider.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/messages_list_widget.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SingleChatPage extends StatefulWidget {
  final SingleChatEntity singleChatEntity;
  const SingleChatPage({Key? key, required this.singleChatEntity})
      : super(key: key);

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  File? _image;
  final picker = ImagePicker();
  late String _photoUrl;

  final focusNode = FocusNode();
  String? replyMessage;

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    BlocProvider.of<ChatBloc>(context)
        .add(ChatEvent.getMessages(channelId: widget.singleChatEntity.groupId));
    _photoUrl = '';
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // * Future function whose uploads pictures from system gallery
  // TODO: This function using in the both widgets, so its need to fix
  Future getImage() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery).catchError((err) {
        Fluttertoast.showToast(
            msg: err.toString(), backgroundColor: Colors.grey);
      });

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          StorageProviderRemoteDataSource.uploadFile(file: _image!)
              .then((value) {
            setState(() {
              _photoUrl = value;
              BlocProvider.of<ChatBloc>(context).add(ChatEvent.sendTextMessage(
                textMessageEntity: TextMessageEntity(
                    time: Timestamp.now(),
                    senderId: widget.singleChatEntity.uid,
                    content: _photoUrl,
                    senderName: widget.singleChatEntity.username,
                    receiverName: '',
                    recipientId: '',
                    type: "IMAGE",
                    replyingMessage: replyMessage),
                channelId: widget.singleChatEntity.groupId,
              ));
            });
          });
        } else {
          Fluttertoast.showToast(
              msg: "No image selected", backgroundColor: Colors.grey);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "error $e", backgroundColor: Colors.grey);
      rethrow;
    }
  }

  void updateFunc() {
    BlocProvider.of<GroupBloc>(context).add(GroupEvent.updateGroupEvent(
        groupEntity: GroupEntity(
      groupId: widget.singleChatEntity.groupId,
      lastMessage: _messageController.text,
      creationTime: Timestamp.now(),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: profileWidget(
                  imageUrl: widget.singleChatEntity.groupProfileImage,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(widget.singleChatEntity.groupName),
          ],
        ),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (index, state) {
          return state.when(
            initial: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            loading: () => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
            loaded: (messages) {
              return Column(
                children: [
                  MessagesListWidget(
                    messages: messages,
                    controller: _scrollController,
                    image: _image,
                    userId: widget.singleChatEntity.uid,
                    groupId: widget.singleChatEntity.groupId,
                    onSwipedMessage: (message) {
                      replyToMessage(message);
                      focusNode.requestFocus();
                    },
                  ),
                  SendMessageTextWidget(
                    getImage: getImage,
                    messageFunc: updateFunc,
                    controller: _messageController,
                    replyMessage: replyMessage,
                    name: widget.singleChatEntity.username,
                    onCancelReply: cancelReply,
                    channelId: widget.singleChatEntity.groupId,
                    content: _messageController.text,
                    senderId: widget.singleChatEntity.uid,
                    receiverId: '',
                    receiverName: '',
                    replyName: widget.singleChatEntity.username,
                  )
                ],
              );
            },
            error: (e) => Center(
              child: Text(e, style: const TextStyle(fontSize: 20)),
            ),
          );
        },
      ),
    );
  }

  void replyToMessage(String content) {
    setState(() {
      replyMessage = content;
    });
  }

  void cancelReply() {
    setState(() {
      replyMessage = null;
    });
  }
}
