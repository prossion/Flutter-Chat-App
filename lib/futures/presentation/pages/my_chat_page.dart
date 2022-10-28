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

class MyChatPage extends StatefulWidget {
  final MyChatPageArguments arguments;
  const MyChatPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  String messageContent = "";
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
        .add(ChatEvent.getMessages(channelId: widget.arguments.groupChatId));
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
  // TODO: This function using in the few widgets, so its need to fix
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
                  senderId: widget.arguments.uid,
                  content: _photoUrl,
                  senderName: widget.arguments.peerNickname,
                  receiverName: '',
                  recipientId: '',
                  type: "IMAGE",
                  // replyingMessage: replyMessage!,
                ),
                channelId: widget.arguments.groupChatId,
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
    BlocProvider.of<MyGroupBloc>(context).add(
      MyGroupEvent.updateDataFirestoreEvent(
        collectionPath: "groupChatChannel",
        docPath: widget.arguments.groupChatId,
        dataNeedUpdate: {"content": _messageController.text},
      ),
    );
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
                    imageUrl: widget.arguments.peerAvatar,
                    name: widget.arguments.peerNickname),
              ),
            ),
            const SizedBox(width: 15),
            Text(widget.arguments.peerNickname)
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
                    userId: widget.arguments.uid,
                    groupId: widget.arguments.groupChatId,
                    name: widget.arguments.peerNickname,
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
                    name: widget.arguments.peerNickname,
                    onCancelReply: cancelReply,
                    channelId: widget.arguments.groupChatId,
                    content: _messageController.text,
                    senderId: widget.arguments.uid,
                    receiverId: widget.arguments.peerId,
                    receiverName: widget.arguments.peerNickname,
                    replyName: widget.arguments.peerId == widget.arguments.uid
                        ? "Me"
                        : widget.arguments.peerNickname,
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

class MyChatPageArguments {
  final String peerId;
  final String peerAvatar;
  final String uid;
  final String peerNickname;
  final String groupChatId;

  MyChatPageArguments({
    required this.peerId,
    required this.peerAvatar,
    required this.peerNickname,
    required this.uid,
    required this.groupChatId,
  });
}
