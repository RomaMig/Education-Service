<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>

</head>

<body>
<div>
  <h4><a href="/course/registration">Добавить пользователя</a></h4>
  <h4><a href="/course/">Главная</a></h4>
  <h4><a href="/course/logout">Выйти</a></h4>
  <table>
    <thead>
    <th>ID</th>
    <th>UserName</th>
    <th>Password</th>
    <th>Roles</th>
    <th>Delete</th>
    <th>Add Moder</th>
    <th>Add Admin</th>
    </thead>
    <#list allUsers as user>
      <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>
          <#list user.roles as role>${role.name};</#list>
        </td>
        <td>
          <form action="/course/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button type="submit">Delete</button>
          </form>
        </td>
        <td>
          <form action="/course/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="moder"/>
            <button type="submit">Add Moder</button>
          </form>
        </td>
        <td>
          <form action="/course/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="admin"/>
            <button type="submit">Add Admin</button>
          </form>
        </td>
      </tr>
    </#list>
  </table>
</div>
</body>
</html>