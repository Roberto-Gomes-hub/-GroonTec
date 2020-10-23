// var email= in_email.value;
// div_ola.innerHTML = 'vamo ve se funciona';
function display_login() {
        // if (id_login.style.display == 'block') {
        //     alert('Oi, deu erro');
        // }
        
        var email = in_email.value;
        var senha = in_senha.value;

        if (document.getElementById('id_login').style.display== 'none') {
            document.getElementById('id_login').style.display = 'block';
        }

        else if (document.getElementById('id_login').style.display == "block") {
            if (email == '@gmail' && senha == 'groontech') {
                window.location.href = '../Dashboards/Dashboards.html';
                document.getElementById('div_ola').innerHTML = 'caralhos';
            }
            else if (email == '' && senha == '') {
                alert(`preencha todos os campos`);
            }
            else {
                alert('email ou senha invalida')  
            }
        }  
        else{
            alert('asda')
        }
    }