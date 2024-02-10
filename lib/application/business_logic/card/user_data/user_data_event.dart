part of 'user_data_bloc.dart';

@freezed
class UserDataEvent with _$UserDataEvent {
  factory UserDataEvent.pickImageScanning({required bool camera}) =
      PickImageScanning;
  factory UserDataEvent.removeImageScanning({required int index}) =
      RemoveImageScanning;
  factory UserDataEvent.processImageScanning(
      {required List<ImageModel> images}) = ProcessImageScanning;
  factory UserDataEvent.getUserDetail() = GetUserDetail;
  factory UserDataEvent.pickUserPhotos() = PickUserPhotos;
  factory UserDataEvent.createPersonalData() = CreatePersonalData;
  factory UserDataEvent.removeUserPhoto({required int index}) = RemoveUserPhoto;
  factory UserDataEvent.addAccolade({required Accolade accolade}) = AddAccolade;
  factory UserDataEvent.removeAccolade({required int index}) = RemoveAccolade;
  factory UserDataEvent.addDateToRemember(
      {required DatesToRemember datesToRemember}) = AddDateToRemember;
  factory UserDataEvent.removeDateToRemember({required int index}) =
      RemoveDateToRemember;
  factory UserDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  factory UserDataEvent.removeSocialMedia({required int index}) =
      RemoveSocialMedia;
  factory UserDataEvent.createCard({required CreateCardModel createCardModel}) = CreateCard;
}
