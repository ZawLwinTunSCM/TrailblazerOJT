$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip();

  if ($("div").hasClass("text-success") == true) {
    new Promise((resolve) => setTimeout(resolve, 3000)).then(() => {
      $(".text-success").remove();
    });
  }

  var listItems = document.querySelectorAll(
    "#pag > ul > li > span, #pag > ul > li > a"
  );

  for (var i = 0; i < listItems.length; i++) {
    listItems[i].className = "page-link";
  }

  var postTbl = $(".table").DataTable({
    searching: false,
    info: false,
    columnDefs: [
      {
        searchable: false,
        orderable: false,
        targets: "no-sort",
      },
      {
        width: "5%",
        targets: 0,
      },
      {
        width: "20%",
        targets: 1,
      },
      {
        width: "30%",
        targets: 2,
      },
      {
        width: "20%",
        targets: 3,
      },
      {
        width: "5%",
        targets: 4,
      },
      {
        width: "20%",
        targets: 5,
      },
    ],
    order: [[5, "desc"]],
    lengthMenu: [1, 5, 10, 20, 50],
    pageLength: 10,
    language: {
      paginate: {
        previous: "<i class='fas fa-angle-double-left'></i>",
        next: "<i class='fas fa-angle-double-right'></i>",
      },
    },
  });

  postTbl
    .on("order.dt search.dt", function () {
      let i = 1;
      postTbl
        .cells(null, 0, { search: "applied", order: "applied" })
        .every(function (cell) {
          this.data(i++);
        });
    })
    .draw();
});
