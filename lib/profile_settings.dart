import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile_value_notifier.dart';

// Profile picture link
// https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png

class ProfileSettings extends StatefulWidget{
  // Constructor
  const ProfileSettings({Key? key}): super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings>{
  // Instance Variables
  var profile = ProfileValueNotifier();
  final ValueNotifier<Profile> _profile = ValueNotifier(ProfileValueNotifier());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[600],
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _profile,
                builder: (context, value, _){
                  if(_profile.value.imageUrl != ''){
                    return Image.network(
                      _profile.value.imageUrl,
                      width: 100,
                      height: 100,
                    );
                  }
                  else{
                    return const Text('');
                  }
                }
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                    icon: Icon(Icons.text_fields),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: Colors.grey
                        )
                    ),
                    labelText: 'First Name'
                ),
                onChanged: (text){
                  _profile.value = profile.update(firstName: text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                    icon: Icon(Icons.text_fields),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: Colors.grey
                        )
                    ),
                    labelText: 'Last Name'
                ),
                onChanged: (text){
                  _profile.value = profile.update(lastName: text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                    icon: Icon(Icons.image),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: Colors.grey
                        )
                    ),
                    labelText: 'Image URL'
                ),
                onChanged: (text){
                  _profile.value = profile.update(imageUrl: text);
                },
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _profile,
                builder: (context, value, _){
                  if(_profile.value.lastName != '' && _profile.value.firstName != ''){
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(

                            'Hello, I am ${_profile.value.firstName} ${_profile.value.lastName}!'
                        )
                    );
                  }
                  else{
                    return const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                            'You do not have a full name!'
                        )
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}