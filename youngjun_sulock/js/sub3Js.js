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

// ==========================섹션 3 모달======================

$(function () {
  $("#sec3_modal").hide();
  $(".modal-backdrop").hide();
  $(".sec3_title button").click(function () {
    $("#sec3_modal").show();
    $(".modal-backdrop").show();
    $("body").css("overflow", "hidden"); // 스크롤 비활성화
  });

  $(".close, .modal-backdrop").click(function () {
    $("#sec3_modal").hide();
    $(".modal-backdrop").hide();
    $("body").css("overflow", "auto"); // 스크롤 활성화
  });
});

// =====================섹션 4 모달스======================

$(function () {
  let s4_modal01 = $(".sec4_box1_modal");
  let s4_modal02 = $(".sec4_box2_modal");
  let s4_modal03 = $(".sec4_box3_modal");
  let s4_modalbtn01 = $(".sec4_box1_text button");
  let s4_modalbtn02 = $(".sec4_box2_text button");
  let s4_modalbtn03 = $(".sec4_box3_text button");

  s4_modal01.hide();
  s4_modal02.hide();
  s4_modal03.hide();
  $(".modal-backdrop").hide();

  s4_modalbtn01.click(function () {
    s4_modal01.show();
    $(".modal-backdrop").show();
    $("body").css("overflow", "hidden"); // 스크롤 비활성화
  });
  s4_modalbtn02.click(function () {
    s4_modal02.show();
    $(".modal-backdrop").show();
    $("body").css("overflow", "hidden"); // 스크롤 비활성화
  });
  s4_modalbtn03.click(function () {
    s4_modal03.show();
    $(".modal-backdrop").show();
    $("body").css("overflow", "hidden"); // 스크롤 비활성화
  });

  $(".close, .modal-backdrop").click(function () {
    s4_modal01.hide();
    s4_modal02.hide();
    s4_modal03.hide();
    $(".modal-backdrop").hide();
    $("body").css("overflow", "auto"); // 스크롤 활성화
  });
});

$(function () {
  $(".sec5_box").each(function () {
    var $thisBox = $(this);
    var $btn1 = $thisBox.find(".sec5_box_btn1");
    var $btn2 = $thisBox.find(".sec5_box_btn2");
    var $body1 = $thisBox.find(".sec5_box_body1");
    var $body2 = $thisBox.find(".sec5_box_body2");

    $btn1.click(function () {
      $body2.stop().animate({ opacity: 0.8 }, 0.5, function () {
        $body1.show().animate({ opacity: 1 }, 0.5); // 먼저 show 후 투명도 조정
        $(this).hide(); // 이제 display를 none으로 설정
      });
    });

    $btn2.click(function () {
      $body1.stop().animate({ opacity: 0.8 }, 0.5, function () {
        $body2.show().animate({ opacity: 1 }, 0.5); // 먼저 show 후 투명도 조정
        $(this).hide(); // 이제 display를 none으로 설정
      });
    });

    // 초기 상태 설정
    $body1.css({ display: "block", opacity: 1 });
    $body2.css({ display: "none", opacity: 0 });
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
