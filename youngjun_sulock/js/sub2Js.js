// ================메인메뉴 스크립트====================

$(function () {
  let Mainli = $("#Mainmenu");
  let MainA = $("#Mainmenu a");
  let MainLogo = $("#Mainmenu h1 a img");
  let originalLogoUrl =
    "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_white.png";
  let hoverLogoUrl =
    "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_black.png";
  let hideMenu = $(".hideMenu");
  let hideList = $(".hideMenu ul");
  let left_menu = $(".left_box ul li a");

  hideMenu.hide();

  function showMainMenu() {
    Mainli.css("background", "white");
    MainA.css("color", "#333333");
  }

  function hideMainMenu() {
    Mainli.css("background", "white");
    MainA.css("color", "#333333");
  }

  Mainli.hover(
    function () {
      showMainMenu();
    },
    function () {
      // 마우스가 hideMenu를 벗어나면 Mainmenu가 숨겨져 있을 때만 hideMainMenu실행
      if (!hideMenu.is(":visible")) {
        hideMainMenu();
      }
    }
  );
  $(".left_box ul li a").hover(
    function () {
      // 마우스가 요소 위에 있을 때
      $(this).css("color", "green");
    },
    function () {
      // 마우스가 요소를 벗어났을 때
      $(this).css("color", "white");
    }
  );

  MainA.hover(
    function () {
      $(this).css("color", "green");
    },
    function () {
      $(this).css("color", "#333333");
    }
  );

  left_menu.eq(0).hover(
    function () {
      hideMenu.slideDown();
      showMainMenu(); // hideMenu가 나타날 때 Mainmenu도 hover 상태로 유지
    },
    function () {
      // 마우스가 메인메뉴와 hideMenu를 벗어나면 숨김
      $(document).on("mouseover", function (e) {
        if (
          !hideMenu.is(e.target) &&
          hideMenu.has(e.target).length === 0 &&
          !Mainli.is(e.target) &&
          Mainli.has(e.target).length === 0
        ) {
          hideMenu.slideUp();
          hideMainMenu();
        }
      });
    }
  );

  $(window).scroll(function () {
    //스크롤이 내려가면 스타일 바뀌
    let scroll = $(window).scrollTop();
    if (scroll >= 100) {
      Mainli.css("background", "white");
      MainA.css("color", "#333333");
      MainLogo.attr("src", hoverLogoUrl);
    }
    if (scroll < 100) {
      MainA.css("color", "white");
      Mainli.css(
        "background",
        "linear-gradient(to bottom, rgba(0, 0, 0, 0.33), rgba(255, 255, 255, 0))"
      );
      MainLogo.attr("src", originalLogoUrl);
    }
  });
});

$(function () {
  let burger_close_Btn = $("#smallMenu span");
  let burgerMenuBtn = $(".burgerBtn");
  let burgerMenu = $("#smallMenu");
  let body = $("body");

  burgerMenu.hide();

  // smallMenu 내부에서 스크롤이 가능하도록 설정
  burgerMenu.css("overflow-y", "auto");

  burgerMenuBtn.click(function (event) {
    event.stopPropagation();
    burgerMenu.show();
    body.css("overflow", "hidden"); // 배경 스크롤 비활성화
  });

  burger_close_Btn.click(function () {
    burgerMenu.hide();
    body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
  });

  $(document).click(function () {
    burgerMenu.hide();
    body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
  });
});

//footer 영역 토글 구현
document.addEventListener("DOMContentLoaded", function () {
  var toggleButton = document.getElementById("toggleFooter");
  var miniFooter = document.querySelector(".mini_footer");

  toggleButton.addEventListener("click", function () {
    // 화면 너비가 1050px 이하일 때만 토글 기능이 작동합니다.
    if (window.innerWidth <= 1050) {
      miniFooter.style.display =
        miniFooter.style.display === "block" ? "none" : "block";
    }
  });

  // 화면 크기 변경에 따라 mini_footer의 표시 여부를 조정합니다.
  window.addEventListener("resize", function () {
    if (window.innerWidth > 1050) {
      miniFooter.style.display = "none";
    } else {
      // 화면이 1050px 이하로 변경될 때 기본적으로 숨깁니다.
      miniFooter.style.display = "none";
    }
  });
});
