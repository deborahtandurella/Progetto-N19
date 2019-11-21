<html>
<%@ page language="java"%>
<%@ page session="true"%>
<jsp:useBean id='test' scope='session' class='Interface.WebInterface.TestSito' type="Interface.WebInterface.TestSito" />
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>PC builder</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="../index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="https://pcpartpicker.com/">PCPartPicker</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Build your PC</a>
        </li>
      </ul>
</nav>

<br>

<div class="container">
<div class="jumbotron text-center" style= "background-image: url(https://mdbootstrap.com/img/Photos/Others/gradient1.jpg)">
    <p class="bg-primary text-white"><h1>BUILD YOUR PC</h1>
    </p>
        <form method="post">

        <% String[] list = test.getComponenti(); for(int i = 0; i<list.length;i++){ %>

            <button type="submit" name=buttonA class="btn btn-secondary" value= <%= list[i]%> > <%= list[i]%> </button>

         <%}%>
        </form>

        <% if(request.getParameter("buttonA") != null){ %> <% test.setcAttivo(request.getParameter("buttonA")); %><% } %>

    </div>
</div>
<center>

<h1> <%=test.getcAttivo()%> </h1>

</center>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>