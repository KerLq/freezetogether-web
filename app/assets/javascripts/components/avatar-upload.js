const avatarProfile = document.querySelector(".profile-avatar");
if (avatarProfile) {
  const hoverChangeAvatar = avatarProfile.querySelector(".avatar-upload");
  const avatarChangeForm = avatarProfile.querySelector("form.edit_user");
  const avatarFileUpload = avatarChangeForm.querySelector("input#user_avatar");

  hoverChangeAvatar.onclick = function () {
    avatarFileUpload.click();
  };

  avatarFileUpload.onchange = function () {
    avatarChangeForm.submit();
  };
}
