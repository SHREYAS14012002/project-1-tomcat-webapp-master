<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./index.css">
    <style>
/* google fonts import link and use the font family use font use */
@import url('https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto Slab', serif;
    
}

body{
    background-image: linear-gradient(to right,#0f2027,#203a43,#2c5364);
}

#form{
    width: 300px;
    margin: 20vh auto 0vh auto;
    background-color: whitesmoke;
    padding: 20px;
    border-radius: 4px;
 
}

#form input{
    background-color: rgba(246, 228, 206, 0.437);
}

#form h1{
    margin: 10px;
    text-align: center;
}

.input-control{
    display: flex;
    flex-direction: column;
}

.input-control input{
    width: 100%;
    border: 1px solid white;
    padding: 10px;
    border-radius: 4px;
}

.input-control input:focus{
    outline: none;
}

#form button{
    width: 100%;
    border: none;
    background-color: rgb(10, 104, 71);
    color: white;
    padding: 10px;
    border-radius: 4px;
    margin-top: 10px;
}


/* if error get color to background */
.input-control.error input{
    border-color: rgb(200, 53, 53);
}

.input-control.success input{
    border-color: rgb(10, 104, 71);
}


.input-control .error {
    border-color: rgb(200, 53, 53);
    font-size: 10px;
    height: 20px;
    color: rgb(200, 53, 53);
}
    </style>
</head>
<body>
    <div class="container">
        <form action="" id="form">
            <h1>Registration</h1>
        <div class="input-control">
            <label for="username">Username</label>
            <input type="text" name="username" id="username">
            <div class="error"></div>
        </div>
        <div class="input-control">
            <label for="email">Email</label>
            <input type="text" name="email" id="email">
            <div class="error"></div>
        </div>
        <div class="input-control">
            <label for="password">Password</label>
            <input type="password" name="password" id="password">
            <div class="error"></div>
        </div>
        <div class="input-control">
            <label for="password2">Password again</label>
            <input type="password" name="password2" id="password2">
            <div class="error"></div>
        </div>
        <button type="submit">Sign Up</button>
    </div>
        </form>

    <script>
let form=document.getElementById("form")
let username=document.getElementById("username")
let email=document.getElementById("email")
let password=document.getElementById("password")
let password2=document.getElementById("password2")

form.addEventListener("submit",(e)=>{
    e.preventDefault()

    validateInputs()
})   

const setError=(element,message)=>{
    const inputControl=element.parentElement
    const error=inputControl.querySelector(".error")

    error.innerText=message;
    inputControl.classList.add("error")
    inputControl.classList.remove("success")
}

const setSuccess=(element)=>{
    const inputControl=element.parentElement
    const error=inputControl.querySelector(".error")

    error.innerText="";
    inputControl.classList.add("success")
    inputControl.classList.remove("error")
}

const isValidEmail=(email)=>{
    const re=/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    return re.test(String(email).toLowerCase())
}

const validateInputs=()=>{
    const usernameValue=username.value.trim()
    const emailValue=email.value.trim()
    const passwordValue=password.value.trim()
    const passwordValue2=password2.value.trim()

    if(usernameValue===""){
        setError(username,"Username is required")
    }else{
        setSuccess(username)
    }
    
    if (emailValue===""){
        setError(email,"Email is required")
    }else if(!isValidEmail(emailValue)){
        setError(email,"Provide a valid email")
    }else{
        setSuccess(email)
    }
    

    if(passwordValue===""){
        setError(password,"Password is required")
    }
    else if(passwordValue.length<8){
        setError(password,"Password should br minimum 8 characters")
    }else{
        setSuccess(password)
    }

    if(passwordValue2===""){
        setError(password2,"Password is required")
    }
    else if(passwordValue2!=passwordValue){
        setError(password,"Password is not matching")
    }else{
        setSuccess(password2)
    }
}
</script>
</body>
</html>
