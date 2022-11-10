<%-- 
    Document   : footer
    Created on : Oct 20, 2022, 1:16:41 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>PreSkool</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/footer.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <style>
            .custom-select {
                position: relative;
                font-family: Arial;
            }

            .custom-select select {
                display: none; /*hide original SELECT element: */
            }

            /* Style the arrow inside the select element: */
            .select-selected:after {
                position: absolute;
                content: "";
                top: 14px;
                right: 10px;
                width: 0;
                height: 0;
                border: 6px solid transparent;
                border-color: #fff transparent transparent transparent;
            }

            /* Point the arrow upwards when the select box is open (active): */
            .select-selected.select-arrow-active:after {
                border-color: transparent transparent #fff transparent;
                top: 7px;
            }

            /* style the items (options), including the selected item: */
            .select-items div,.select-selected {
                color: black;
                padding: 8px 16px;
                border: 1px solid transparent;
                border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
                cursor: pointer;
            }
            
            .select-selected {
                padding: 0;
            }

            /* Style items (options): */
            .select-items {
                position: absolute;
                background-color: white;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 99;
            }

            /* Hide the items when the select box is closed: */
            .select-hide {
                display: none;
            }

            .select-items div:hover, .same-as-selected {
                background-color: rgba(0, 0, 0, 0.1);
            }
            footer {
                position: absolute;
                width: 100%;
                height: 500px;
                left: 319px;
                right: 0;
            }
        </style>
    </head>
    <body>
        <footer>
            <div class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <img class="logo1" src="assets/img/logo-white.png" alt="logo"/>                     
                            <ul class="about_us">
                                <li>Address:<br> Hoang Mai District, Hanoi, VietNam <br>Email: anhanh@mail.com <br> Tel: 0123456789<br> MST: 123456789</li>
                            </ul>
                            <ul class="social_icon">
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-8">
                            <form id="request" class="main_form" action="web_contact_info" method="post" style="width: 400px;">
                                <div class="row">
                                    <div class="col-md-12 " style="padding-top: 10px;">
                                        <input class="contactus" placeholder="Name" type="text" name="name"> 
                                    </div>
                                    <div class="col-md-12">
                                        <input class="contactus" placeholder="Email" type="email" name="email"> 
                                    </div>
                                    <div class="col-md-12">
                                        <input class="contactus" placeholder="Phone Number" type="text" name="mobile">                          
                                    </div>                               
                                    <div class="custom-select" style="width:200px;">
                                        <select>
                                            <option value="0">Select Contact Type:</option>
                                            <option value="1">Message</option>
                                            <option value="2">Phone</option>
                                            <option value="3">Email</option>                                            
                                        </select>
                                    </div>                              
                                    <div class="col-md-12" style="padding-top: 10px;">                                      
                                        <input class="contactus" placeholder="Message" type="text" name="message">
                                    </div>
                                    <div class="col-md-12">
                                        <input class="send_btn" type="submit" value="Send">                           
                                    </div>
                                </div>
                            </form>
                        </div>                                                                       
                    </div>
                </div>
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10 offset-md-1">
                                <p>© 2019 All Rights Reserved.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            var x, i, j, l, ll, selElmnt, a, b, c;
            /* Look for any elements with the class "custom-select": */
            x = document.getElementsByClassName("custom-select");
            l = x.length;
            for (i = 0; i < l; i++) {
                selElmnt = x[i].getElementsByTagName("select")[0];
                ll = selElmnt.length;
                /* For each element, create a new DIV that will act as the selected item: */
                a = document.createElement("DIV");
                a.setAttribute("class", "select-selected");
                a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                x[i].appendChild(a);
                /* For each element, create a new DIV that will contain the option list: */
                b = document.createElement("DIV");
                b.setAttribute("class", "select-items select-hide");
                for (j = 1; j < ll; j++) {
                    /* For each option in the original select element,
                     create a new DIV that will act as an option item: */
                    c = document.createElement("DIV");
                    c.innerHTML = selElmnt.options[j].innerHTML;
                    c.addEventListener("click", function (e) {
                        /* When an item is clicked, update the original select box,
                         and the selected item: */
                        var y, i, k, s, h, sl, yl;
                        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                        sl = s.length;
                        h = this.parentNode.previousSibling;
                        for (i = 0; i < sl; i++) {
                            if (s.options[i].innerHTML == this.innerHTML) {
                                s.selectedIndex = i;
                                h.innerHTML = this.innerHTML;
                                y = this.parentNode.getElementsByClassName("same-as-selected");
                                yl = y.length;
                                for (k = 0; k < yl; k++) {
                                    y[k].removeAttribute("class");
                                }
                                this.setAttribute("class", "same-as-selected");
                                break;
                            }
                        }
                        h.click();
                    });
                    b.appendChild(c);
                }
                x[i].appendChild(b);
                a.addEventListener("click", function (e) {
                    /* When the select box is clicked, close any other select boxes,
                     and open/close the current select box: */
                    e.stopPropagation();
                    closeAllSelect(this);
                    this.nextSibling.classList.toggle("select-hide");
                    this.classList.toggle("select-arrow-active");
                });
            }

            function closeAllSelect(elmnt) {
                /* A function that will close all select boxes in the document,
                 except the current select box: */
                var x, y, i, xl, yl, arrNo = [];
                x = document.getElementsByClassName("select-items");
                y = document.getElementsByClassName("select-selected");
                xl = x.length;
                yl = y.length;
                for (i = 0; i < yl; i++) {
                    if (elmnt == y[i]) {
                        arrNo.push(i)
                    } else {
                        y[i].classList.remove("select-arrow-active");
                    }
                }
                for (i = 0; i < xl; i++) {
                    if (arrNo.indexOf(i)) {
                        x[i].classList.add("select-hide");
                    }
                }
            }

            /* If the user clicks anywhere outside the select box,
             then close all select boxes: */
            document.addEventListener("click", closeAllSelect);
        </script>
    </body>
</html>
