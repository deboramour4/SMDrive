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
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }
});

$(document).ready(function(){
 // Prepare the preview for profile picture
    $("#wizard-picture").change(function(){
        readURL(this);
    });
    
        
    $('#see-pass').hover(function() {
        //Change the attribute to text
        $('#pass').attr('type', 'text');
        $('#see-pass').removeClass('fa-eye').addClass('fa-eye-slash');
        }, function () {
        //Change the attribute back to password
        $('#pass').attr('type', 'password');
        $('#see-pass').removeClass('fa-eye-slash').addClass('fa-eye');
        }
    );
   
   
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