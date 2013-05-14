<div id="logIn">

  <div>Not a member? <a href="/user/register">Register Now!</a></div>
  <h2>Login</h2>

  <form action="/user/perform-login"
        enctype="multipart/form-data"
        method="post"
        id='loginForm'>

      <label for='username'>Username</label>
      <input type='text' name='username' id='username' value='Username'>

      <label for='password'>Password</label>
      <input type='password' name='password' id='password' value='password'>

      <input type='submit' value='Submit'>

  </form>

</div>