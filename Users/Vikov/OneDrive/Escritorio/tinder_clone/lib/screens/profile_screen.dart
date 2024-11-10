import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).user;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("${user?.name ?? ''}, ${user?.age ?? ''}"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.share, color: Colors.white),
                        title: Text("Share",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.block, color: Colors.white),
                        title: Text("Block",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.report, color: Colors.red),
                        title:
                            Text("Report", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Me Section
              SizedBox(height: 16),
              Text(
                "About me",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                user?.bio ?? '',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              // Interests Section
              SizedBox(height: 16),
              Text(
                "Interests",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: user?.interests
                        .map((interest) => Chip(
                              label: Text(interest),
                              backgroundColor: Colors.grey[700],
                              labelStyle: TextStyle(color: Colors.white),
                            ))
                        .toList() ??
                    [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
