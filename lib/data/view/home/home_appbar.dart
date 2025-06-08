import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

homeAppBar(BuildContext context) => AppBar(
      title: SvgPicture.asset("assets/images/instagram.svg", height: 30),
      actions: [
        GestureDetector(
          onTap: () => context.push("/profile"),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
