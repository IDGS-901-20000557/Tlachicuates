function loadingLogin(){
    if($('#txtUsuario').val().length == 0 ||
    $('#txtContrasenia').val().length == 0){
    }else{
        loading();
    }
    }

    function loadingRegister(){
        if($('#txtNombre').val().length == 0 ||
        $('#txtApePaterno').val().length == 0  ||
        $('#txtApeMaterno').val().length == 0 ||
        $('#txtCorreo2').val().length == 0 ||
        $('#txtContrasenia2').val().length == 0 ||
        $('#txtTelefono').val().length == 0){
        }else{
            loading();
        }
        }