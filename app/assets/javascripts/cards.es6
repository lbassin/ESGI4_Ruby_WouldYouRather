const Cards = [];
var cardSelected = false;

class Card {

    constructor(element) {
        this.mousemove = false;
        this.element = element;
        this.card = this.element.children[0];
        this.mouseX = 0;
        this.mouseY = 0;
        this.element.onmouseenter = this.EnableMouseMove.bind(this);
        this.element.onmouseleave = this.DisableMouseMove.bind(this);
        this.element.onmousemove = this.MouseMove.bind(this);
    }

    EnableMouseMove() {
        this.mousemove = true;
    }

    DisableMouseMove() {
        this.mousemove = false;
        window.setTimeout(this.ResetMouseMove.bind(this), 1000);
    }

    ResetMouseMove() {
        if (!this.mousemove) {
            this.card.style.transform = `rotateY(0deg) rotateX(0deg)`
        }
    }

    MouseMove(e) {
        this.mouseX = (e.offsetX - this.card.clientWidth / 2) / 8;
        this.mouseY = ((e.offsetY - this.card.clientHeight / 2) / 8) * -1;
        if (this.mousemove) {
            let rX = this.mouseX;
            let rY = this.mouseY;
            this.card.style.transform = `rotateY(${rX}deg) rotateX(${rY}deg)`
        }
    }
}

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.questions-block .answers .answer-wrap')
        .forEach((elem) => {
            Cards.push(new Card(elem));
        });

    let submitted = false;
    $('.vote-form button').on('click', (event) => {
        if (submitted) {
            event.preventDefault();
            return;
        }
        submitted = true;
    });

    $('.vote-form').on('ajax:success', function (event) {
        let data = event.detail[0];
        if (data.total === 0) {
            data.total = 1;
        }

        let response1 = ((data.results[0] / data.total) * 100).toFixed(1);
        let response2 = ((data.results[1] / data.total) * 100).toFixed(1);

        $('#reponse1').html(response1 + '%');
        $('#reponse2').html(response2 + '%');

        $('.answer').addClass('clicked');

        cardSelected = true;
    });
});


