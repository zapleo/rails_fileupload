function setPreviewImage(e) {
  const imageTypes = ["image/jpeg", "image/jpg", "image/png"];
  var file = e.files[0];

  var fileReader = new FileReader();
  fileReader.onload = (function(event) {
    if(imageTypes.includes(file.type)) {
      $("#" + e.id + "_image")[0].src = event.target.result;
    } else {
      $("#" + e.id + "_image")[0].src = "/doc.png";
    }
  });

  fileReader.readAsDataURL(file);
}