document.addEventListener("turbolinks:load", function () {
    let $input = $("[data-behavior='autocomplete']");

    let options = {
        getValue: "name",
        url: function(phrase) {
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "countries",
                header: "<strong>Countries</strong>"
            },
            {
                listLocation: "cities",
                header: "<strong>Cities</strong>"
            },
            {
                listLocation: "hotels",
                header: "<strong>Hotels</strong>"
            },
            {
                listLocation: "restaurants",
                header: "<strong>Restaurants</strong>"
            },
        ],
        list: {
            onChooseEvent: function() {
                let url = $input.getSelectedItemData().url
                $input.val("")
                Turbolinks.visit(url)
            }
        }
    }

    $input.easyAutocomplete(options)
})