<%@page import="java.util.List"%>
<%@page import="model.task"%>
<%@page import="dao.taskDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    taskDao dao = new taskDao();
    List<task> tasks = dao.getAllTasks();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>To-Do List</title>
    <style>
/* ========= GLOBAL ========= */
body {
  font-family: "Poppins", "Segoe UI", sans-serif;
  background: linear-gradient(135deg, #c3ecf7, #f9e3ff);
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: 100vh;
}

/* ========= CONTAINER ========= */
.todo-container {
  background: #ffffff;
  margin-top: 70px;
  width: 420px;
  border-radius: 16px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
  padding: 30px 35px;
  transition: transform 0.3s ease;
}

.todo-container:hover {
  transform: translateY(-3px);
}

.todo-container h1 {
  text-align: center;
  color: #2d2d2d;
  margin-bottom: 25px;
  font-size: 28px;
  letter-spacing: 0.5px;
  font-weight: 700;
}

/* ========= INPUT SECTION ========= */
.input-section {
  display: flex;
  gap: 10px;
  margin-bottom: 25px;
}

#taskInput {
  flex: 1;
  padding: 12px 15px;
  border: 2px solid #e5e7eb;
  border-radius: 10px;
  font-size: 15px;
  transition: all 0.3s ease;
}

#taskInput:focus {
  border-color: #6d28d9;
  outline: none;
  box-shadow: 0 0 6px rgba(109,40,217,0.3);
}

/* ========= BUTTONS ========= */
button {
  padding: 10px 20px;
  background-color: #6d28d9;
  color: #fff;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size: 15px;
  transition: all 0.3s ease;
  font-weight: 500;
}

button:hover {
  background-color: #5b21b6;
  transform: scale(1.05);
}

/* ========= TASK LIST ========= */
#taskList {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

.task {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #f9fafb;
  border: 1px solid #e5e7eb;
  padding: 12px 15px;
  border-radius: 10px;
  margin-bottom: 12px;
  transition: all 0.25s ease;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
}

.task:hover {
  background: #f3f4f6;
  transform: translateY(-2px);
}

.task span {
  flex: 1;
  color: #1f2937;
  font-size: 16px;
  font-weight: 500;
  word-wrap: break-word;
}

.task form {
  margin: 0;
}

.task button {
  background-color: #ef4444;
  padding: 8px 14px;
  border-radius: 8px;
  font-size: 14px;
}

.task button:hover {
  background-color: #dc2626;
}

/* ========= RESPONSIVE ========= */
@media (max-width: 480px) {
  .todo-container {
    width: 90%;
    padding: 25px;
  }
  #taskInput {
    font-size: 14px;
  }
  button {
    font-size: 14px;
    padding: 8px 15px;
  }
}
</style>

</head>
<body>
    <div class="todo-container">
        <h1>📝 To-Do List</h1>
        <div class="input-section">
            <form action="task" method="post" style="display: flex; width: 100%; gap: 10px;">
                <input type="text" id="taskInput" name="task" placeholder="Enter your task...">
                <button type="submit">Add</button>
            </form>
        </div>

        <ul id="taskList">
            <%
                for (task s : tasks) {
            %>
            <li class="task">
                <span><%= s.getTask() %></span>
                <form action="task" method="get">
                    <input type="hidden" name="id" value="<%= s.getId() %>">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit">Delete</button>
                </form>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</body>
</html>
