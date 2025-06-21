<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDB.aspx.cs" Inherits="HRMSTeam3.LoginDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    <style>
       .form-control:focus {
            color: #311E10;
            border-color: #311E10;
            box-shadow: 0 0 5px 2px #311E10;
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100">
              <div class="container py-2 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                  <div class="col-md-8 col-lg-7 col-xl-6">
                    <img src="/meet.png"
                      class="img-fluid" alt="Phone image">
                  </div>
                  <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                    <form >
                        <h2 class="fw-bold mb-5 align-items-center">Login</h2>
                      <!-- Email input -->
                      <div data-mdb-input-init class="form-outline mb-4">
                        <%--<input type="email" id="form1Example13" class="form-control form-control-lg" />--%>
                         <asp:TextBox class="form-control form-control-lg" CssClass="form-control"  ID="TextBox1" runat="server"></asp:TextBox>
                        <label class="form-label" for="form1Example13">Email address</label>
                      </div>

                      <!-- Password input -->
                      <div data-mdb-input-init class="form-outline mb-4">
                        <%--<input type="password" id="form1Example23"  />--%>
                          <asp:TextBox class="form-control form-control-lg" ID="TextBox2"  CssClass="form-control"  runat="server" TextMode="Password"></asp:TextBox>
                        <label class="form-label" for="form1Example23">Password</label>
                      </div>


                      <!-- Submit button -->
                        <asp:Button data-mdb-button-init data-mdb-ripple-init class="btn btn-lg btn-block text-light" style="background-color: #311E10; border: none;"  ID="Button1" runat="server" Text="Sign in" OnClick="Button1_Click" />

                    </form>
                  </div>
                </div>
              </div>
            </section>
    </form>
</body>
</html>
