document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.delete').forEach(function(a) {
    a.addEventListener('ajax:success', function() {
      let td = a.parentNode;
      let tr = td.parentNode;
      tr.style.display = 'none';
    });
  });
});
