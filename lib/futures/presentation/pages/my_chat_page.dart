import 'dart:async';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/storage_provider.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:flutter_social_app/futures/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MyChatPage extends StatefulWidget {
  final MyChatPageArguments arguments;
  const MyChatPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  String messageContent = "";
  final TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  File? _image;
  final picker = ImagePicker();
  late String _photoUrl;

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    BlocProvider.of<ChatBloc>(context)
        .add(GetMessagesEvent(channelId: widget.arguments.groupChatId));
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
              BlocProvider.of<ChatBloc>(context).add(SendTextMessageEvent(
                  textMessageEntity: TextMessageEntity(
                      time: Timestamp.now(),
                      senderId: widget.arguments.uid,
                      content: _photoUrl,
                      senderName: widget.arguments.peerNickname,
                      receiverName: '',
                      recipientId: '',
                      type: "IMAGE"),
                  channelId: widget.arguments.groupChatId));
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

  // Send and update the group chat in a separate function
  // that we have the option to provide in the sendTextMessage widget
  // * It may need to be fixed for better appearance and performance
  void messageFunc() {
    BlocProvider.of<ChatBloc>(context).add(SendTextMessageEvent(
        textMessageEntity: TextMessageEntity(
            time: Timestamp.now(),
            senderId: widget.arguments.uid,
            content: _messageController.text,
            senderName: widget.arguments.uid,
            recipientId: widget.arguments.peerId,
            receiverName: widget.arguments.peerNickname,
            type: "TEXT"),
        channelId: widget.arguments.groupChatId));
    BlocProvider.of<MyGroupBloc>(context).add(
      UpdateDataFirestoreEvent(
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
          if (state is ChatLoadedState) {
            return Column(
              children: [
                _messagesListWidget(state),
                SendMessageTextWidget(
                    getImage: getImage,
                    messageFunc: messageFunc,
                    controller: _messageController)
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _messagesListWidget(ChatLoadedState messages) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        Timer(const Duration(milliseconds: 100), () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad,
          );
        });
      }
    });

    return Expanded(
      child: widget.arguments.groupChatId.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              itemCount: messages.messages.length,
              itemBuilder: (context, index) {
                final message = messages.messages[index];

                if (message.content!.isNotEmpty) {
                  if (message.senderId == widget.arguments.uid) {
                    return message.type == "TEXT"
                        ? TextMessageLayout(
                            text: message.content,
                            time: DateFormat('hh:mm a')
                                .format(message.time!.toDate()),
                            color: Theme.of(context).cardColor,
                            align: TextAlign.left,
                            boxAlign: CrossAxisAlignment.start,
                            nip: BubbleNip.rightTop,
                            crossAlign: CrossAxisAlignment.end,
                            alignName: TextAlign.end,
                            groupId: widget.arguments.groupChatId,
                            name: 'Me',
                          )
                        : ImageMessageLayout(
                            imageUrl: message.content!,
                            align: TextAlign.left,
                            alignName: TextAlign.end,
                            boxAlign: CrossAxisAlignment.start,
                            color: Theme.of(context).cardColor,
                            crossAlign: CrossAxisAlignment.end,
                            nip: BubbleNip.rightTop,
                            time: DateFormat('hh:mm a')
                                .format(message.time!.toDate()),
                            name: "Me",
                            image: _image,
                          );
                  } else {
                    return message.type == "TEXT"
                        ? TextMessageLayout(
                            text: message.content,
                            time: DateFormat('hh:mm a')
                                .format(message.time!.toDate()),
                            color: Theme.of(context).cardColor,
                            align: TextAlign.left,
                            boxAlign: CrossAxisAlignment.start,
                            nip: BubbleNip.leftTop,
                            crossAlign: CrossAxisAlignment.start,
                            alignName: TextAlign.end,
                            groupId: widget.arguments.groupChatId,
                            name: widget.arguments.peerNickname,
                          )
                        : ImageMessageLayout(
                            imageUrl: message.content!,
                            align: TextAlign.left,
                            alignName: TextAlign.end,
                            boxAlign: CrossAxisAlignment.start,
                            color: Theme.of(context).cardColor,
                            crossAlign: CrossAxisAlignment.start,
                            nip: BubbleNip.leftTop,
                            time: DateFormat('hh:mm a')
                                .format(message.time!.toDate()),
                            name: "${message.senderName}",
                            image: _image,
                          );
                  }
                } else {
                  return const Center(child: Text("No message here yet..."));
                }
              },
            )
          : const ErrorDisplay(
              title: 'Error', text: 'Error loading chat. Try again'),
    );
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
