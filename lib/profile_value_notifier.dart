import 'profile.dart';

class ProfileValueNotifier extends Profile{
  // Constructor
  ProfileValueNotifier(): super(firstName: '', lastName: '', imageUrl: '');

  // Update function (returns Profile)
  Profile update({firstName, lastName, imageUrl}){
    if(firstName != null){
      this.firstName = firstName;
    }

    if(lastName != null){
      this.lastName = lastName;
    }

    if(imageUrl != null){
      this.imageUrl = imageUrl;
    }

    return Profile(firstName: this.firstName, lastName: this.lastName, imageUrl: this.imageUrl);
  }
}