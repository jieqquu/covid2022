const oriData = [
  {
    id_number: "A123456789",
    date: "2022/06/14",
    name: "陳郁雯",
    birth_date: "1970/01/03",
    sex: 1,
    infect_date: "2020/10/08",
    treatment_place: 3,
    oxygen_treatment: 0,
    ICU_treatment: 0,
    discharge_date: "2020/10/18",
    revisit: 0,
    revisit_division: "NULL",
    email: "bicyclewu0103@gmail.com",
    infect_covid: 1,
    serial_number: "Jk2Kc4Rx",
  },
  {
    id_number: "A234556915",
    date: "2021/12/31",
    name: "林庭瑋",
    birth_date: "1988/03/19",
    sex: 0,
    infect_date: "2020/05/22",
    treatment_place: 1,
    oxygen_treatment: 2,
    ICU_treatment: 1,
    discharge_date: "2021/06/20",
    revisit: 1,
    revisit_division: 1,
    email: "linda0319@gmail.com",
    infect_covid: 1,
    serial_number: "N71LUhhq",
  },
  {
    id_number: "F121748165",
    date: "2021/10/8",
    name: "王怡萱",
    birth_date: "1977/04/17",
    sex: 1,
    infect_date: "2020/11/06",
    treatment_place: 2,
    oxygen_treatment: 0,
    ICU_treatment: 0,
    discharge_date: "2020/11/20",
    revisit: 0,
    revisit_division: "NULL",
    email: "greenton@gmail.com",
    infect_covid: 1,
    serial_number: "JHbj2UCx",
  },
  {
    id_number: "J130745698",
    date: "2021/9/29",
    name: "黃志豪",
    birth_date: "1997/04/21",
    sex: 1,
    infect_date: "2020/03/18",
    treatment_place: 2,
    oxygen_treatment: 0,
    ICU_treatment: 0,
    discharge_date: "2020/03/30",
    revisit: 0,
    revisit_division: "NULL",
    email: "someonelin@gmail.com",
    infect_covid: 1,
    serial_number: "VbDI164l",
  },
  {
    id_number: "A224580162",
    date: "2021/10/8",
    name: "林欣士",
    birth_date: "1971/05/24",
    sex: 0,
    infect_date: "2021/06/18",
    treatment_place: 1,
    oxygen_treatment: 3,
    ICU_treatment: 1,
    discharge_date: "2021/07/15",
    revisit: 1,
    revisit_division: 2,
    email: "kitty0524@gmail.com",
    infect_covid: 1,
    serial_number: "KY7K4uA8",
  },
  {
    id_number: "E174859625",
    date: "2021/10/28",
    name: "阮展江",
    birth_date: "1989/05/24",
    sex: 1,
    infect_date: "2021/05/27",
    treatment_place: 1,
    oxygen_treatment: 1,
    ICU_treatment: 1,
    discharge_date: "2021/06/20",
    revisit: 1,
    revisit_division: 1,
    email: "poorguy@gmail.com",
    infect_covid: 1,
    serial_number: "094OXb41",
  },
  {
    id_number: "F125677498",
    date: "2021/11/20",
    name: "涂仲帆",
    birth_date: "1968/07/4",
    sex: 1,
    infect_date: "2021/06/01",
    treatment_place: 1,
    oxygen_treatment: 2,
    ICU_treatment: 1,
    discharge_date: "2021/06/25",
    revisit: 1,
    revisit_division: 4,
    email: "tommykuo@gmail.com",
    infect_covid: 1,
    serial_number: "4GYvJ1aJ",
  },
  {
    id_number: "F117852963",
    date: "2021/11/20",
    name: "宋佳蓉",
    birth_date: "1950/11/23",
    sex: 1,
    infect_date: "2021/06/01",
    treatment_place: 1,
    oxygen_treatment: 4,
    ICU_treatment: 1,
    discharge_date: "2021/06/30",
    revisit: 1,
    revisit_division: 4,
    email: "andy1123@gmail.com",
    infect_covid: 1,
    serial_number: "W6wp4INa",
  },
  {
    id_number: "B202746817",
    date: "2022/01/15",
    name: "張歡珍",
    birth_date: "1964/05/30",
    sex: 0,
    infect_date: "2021/07/15",
    treatment_place: 1,
    oxygen_treatment: 2,
    ICU_treatment: 1,
    discharge_date: "2021/08/05",
    revisit: 1,
    revisit_division: 3,
    email: "grandmalee@gmail.com",
    infect_covid: 1,
    serial_number: "KzGEs7mw",
  },
  {
    id_number: "A230741325",
    date: "2022/03/08",
    name: "盧珮瑜",
    birth_date: "2001/05/29",
    sex: 0,
    infect_date: "2021/12/21",
    treatment_place: 3,
    oxygen_treatment: 0,
    ICU_treatment: 0,
    discharge_date: "NULL",
    revisit: 0,
    revisit_division: "NULL",
    email: "scaredgirl@gmail.com",
    infect_covid: 0,
    serial_number: "N52NfK6i",
  },
];

const data = oriData.map((d) => [d.id_number, d.name, d.infect_date, ""]);

$(document).ready(function () {
  function detailFunc(pid) {
    console.log(`detail:${pid}`);
  }
  function editFunc(pid) {
    console.log(`edit:${pid}`);
  }
  function removeFunc(pid) {
    console.log(`remove:${pid}`);
  }
  function recoverFunc(pid) {
    console.log(`recover:${pid}`);
  }
  $(document).on("click", ".my-data-table .func .item button", function () {
    const $this = $(this);
    const pid = $(this).closest(".func").data("pid");

    if ($this.hasClass("detail")) {
      detailFunc(pid);
    } else if ($this.hasClass("edit")) {
      editFunc(pid);
    } else if ($this.hasClass("remove")) {
      removeFunc(pid);
    } else if ($this.hasClass("recover")) {
      recoverFunc(pid);
    } else {
      alert("func class not detected:" + this.className);
    }
  });
  $(document).on("mouseenter", ".my-data-table .func .item", function () {
    const $this = $(this);
    $this.find('img').css({
      filter: 'opacity(1)'
    });
  });
  $(document).on("mouseleave", ".my-data-table .func .item", function () {
    const $this = $(this);
    $this.find('img').css({
      filter: 'opacity(0.5)'
    });
  });
});
