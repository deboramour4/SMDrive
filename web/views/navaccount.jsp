<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="files"><img src="img/logo-smdrive2.png" /></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">

      </ul>
        <ul class="navbar-nav navbar-right">
            <li class="nav-item">
                <a class="nav-link nav-profile" href="account">
                    <div class="picture-nav">
                        <img src="<s:property value="#session.profile_img" />" class="picture-src" title=""/>
                    </div> <s:property value="#session.firstName" />
                </a>
            </li>
            <li class="nav-item"><a class="nav-link" href="logout"><span class="fa fa-sign-out"></span> Sair</a></li>
        </ul>
    </div>            
  </nav>