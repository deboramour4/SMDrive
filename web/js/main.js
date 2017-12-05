//Variables
var path;

$('.form, .form-modal').find('input, textarea').on('keyup blur focus', function (e) {
  var $this = $(this),
      label = $this.prev('label');
	if (e.type === 'keyup') {
            if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
            label.removeClass('active highlight'); 
        } else {
            label.removeClass('highlight');   
        }   
    } else if (e.type === 'focus') {     
        if( $this.val() === '' ) {
            label.removeClass('highlight'); 
        } else if( $this.val() !== '' ) {
            label.addClass('highlight');
        }
    }
});

$(document).ready(function(){
 // Prepare the preview for profile picture
    $("#wizard-picture").change(function(){
        readURL(this);
    });
//See password in account edit
    $('#see-pass').hover(function() {
        //Change the attribute to text
        $('#pass').attr('type', 'text');
        $('#see-pass').removeClass('fa-eye').addClass('fa-eye-slash');
        }, function () {
        $('#pass').attr('type', 'password');
        $('#see-pass').removeClass('fa-eye-slash').addClass('fa-eye');
        }
    );
//Pretty file name in upload button 
   $("#upfile").change(function () {
        var path = this.value;
        var filename = path.replace(/^.*\\/, "");
        $("#nameFile").text(filename);
    });  
});

//Function to show image before upload
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//Right click context menu files and folders
$(".file").bind("contextmenu",function(e){
  e.preventDefault();
  var url = ($(this).find('a').attr('href'))
  var split = url.replace('?', '').split('=')
  path = split[1]
  var decodedPath = path.replace(/\+/g, ' ');
  decodedPath = decodeURIComponent(decodedPath);
  $("#deletePathFile").val(decodedPath)
  $("#renamePathFolder").val(decodedPath)
  $(".fileLocation").text(decodedPath)
  console.log(path)
  //console.log(e.pageX + "," + e.pageY);
  $("#cntnr_file").css("left",e.pageX);
  $("#cntnr_file").css("top",e.pageY);      
  $("#cntnr_file").fadeIn(200,startFocusOutFile());      
});

function startFocusOutFile(){
  $(document).on("click",function(){
  $("#cntnr_file").hide();        
  $(document).off("click");
  });
}
$(".folder").bind("contextmenu",function(e){
  e.preventDefault();
  var url = ($(this).find('a').attr('href'))
  var split = url.replace('?', '').split('=')
  var path = split[1]
  var decodedPath = path.replace(/\+/g, ' ');
  decodedPath = decodeURIComponent(decodedPath);
  $("#deletePathFolder").val(decodedPath)
  $("#renamePathFolder").val(decodedPath)
  $(".fileLocation").text(decodedPath)
  console.log(path)
  $("#cntnr_folder").css("left",e.pageX);
  $("#cntnr_folder").css("top",e.pageY);        
  $("#cntnr_folder").fadeIn(200,startFocusOutFolder());      
});

function startFocusOutFolder(){
  $(document).on("click",function(){
  $("#cntnr_folder").hide();        
  $(document).off("click");
  });
}