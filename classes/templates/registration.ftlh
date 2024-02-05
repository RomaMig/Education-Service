<#import "/spring.ftl" as spring/>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
</head>

<body>
<div>
  <form method="POST" modelAttribute="userForm">
    <h2>Регистрация</h2>
    <div>
      <@spring.formInput "userForm.username"/>
    </div>
    <div>
      <@spring.formPasswordInput "userForm.password"/>
    </div>
    <div>
      <@spring.formPasswordInput "userForm.passwordConfirm"/>
    </div>
    <div>
        <#assign options = {"1" : "Администратор", "3":"Модератор"}/>
        <@spring.formCheckboxes "userForm.role", options, ""/>
    </div>

    <button type="submit">Зарегистрировать</button>
  </form>
  <a href="/course/admin">Назад</a>
</div>
</body>
</html>
