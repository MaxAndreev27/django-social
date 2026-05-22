(function () {
  if (!window.bookmarklet) {
    bookmarklet_js = document.body.appendChild(
      document.createElement("script"),
    );
    // Django автоматично підставить правильний хост (локальний або продакшен)
    bookmarklet_js.src =
      "//{{ request.get_host }}/static/js/bookmarklet.js?r=" +
      Math.floor(Math.random() * 9999999999999999);
    window.bookmarklet = true;
  } else {
    bookmarkletLaunch();
  }
})();
