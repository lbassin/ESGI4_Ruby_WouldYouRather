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
        this.element.onclick = this.Click.bind(this);
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
    MouseMove(e){
        this.mouseX = (e.offsetX - this.card.clientWidth / 2 ) / 8;
        this.mouseY = ((e.offsetY - this.card.clientHeight / 2 ) / 8) * -1;
        if(this.mousemove){
            let rX = this.mouseX;
            let rY = this.mouseY;
            this.card.style.transform = `rotateY(${rX}deg) rotateX(${rY}deg)`
        }
    }

    Click(e) {
        if (!cardSelected) {
            $('.vote-form').on('ajax:success', function(event) {
                $('#reponse1').html( ((event.detail[0].response1 /  event.detail[0].total) * 100).toFixed(1) + '%' );
                $('#reponse2').html( ((event.detail[0].response2 /  event.detail[0].total) * 100).toFixed(1) + '%' ) ;

                $('.answer').addClass('clicked');

                cardSelected = true;
            });
        }
    }
}

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.questions-block .answers .answer-wrap')
        .forEach((elem) => {
            Cards.push(new Card(elem));
        });
});


