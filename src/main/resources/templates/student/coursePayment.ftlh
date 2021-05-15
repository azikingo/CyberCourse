<#import "../parts/common.ftlh" as c>
<#import "../parts/pager.ftlh" as p>
<@c.page>
<div class="container mt-5">
    <#if url?contains("/sub")>
        <div class="row justify-content-center">
            <div class="card text-center">
                <div class="card-header">
                    <div class="card col-lg-12 col-12 m-0 p-0">
                        <img style="width: 100%; height: 350px" src="/img/139140a1-39da-4af4-9ede-5174c841ca7d.CSGO.jpg" />
                        <div class="card-title d-flex px-4">
                            <p class="item text-muted">CS GO<label class="register">&reg;</label></p>
                            <p>5500 kzt</p>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <p class="text-muted">Your payment details</p>
                    <div class="numbr mb-3"> <i class=" col-1 fas fa-credit-card text-muted p-0"></i> <input class="col-10 p-0" type="text" placeholder="Card Number"> </div>
                    <div class="line2 col-lg-12 col-12 mb-4"> <i class="col-1 far fa-calendar-minus text-muted p-0"></i> <input class="cal col-5 p-0" type="text" placeholder="MM/YY"> <i class="col-1 fas fa-lock text-muted"></i> <input class="cvc col-5 p-0" type="text" placeholder="CVC"> </div>
                </div>
                <div class="card-footer text-muted">
                    2 days ago
                </div>
            </div>
            <div class="card col-lg-9 col-9 mt-3 p-0">
            </div>
            <div>
                <div class="card-title d-flex px-4">
                    <p class="item text-muted">Barcelona<label class="register">&reg;</label> Chair</p>
                    <p>$5760</p>
                </div>
                <div class="card-body">
                    <p class="text-muted">Your payment details</p>
                    <div class="numbr mb-3"> <i class=" col-1 fas fa-credit-card text-muted p-0"></i> <input class="col-10 p-0" type="text" placeholder="Card Number"> </div>
                    <div class="line2 col-lg-12 col-12 mb-4"> <i class="col-1 far fa-calendar-minus text-muted p-0"></i> <input class="cal col-5 p-0" type="text" placeholder="MM/YY"> <i class="col-1 fas fa-lock text-muted"></i> <input class="cvc col-5 p-0" type="text" placeholder="CVC"> </div>
                </div>
                <div class="footer text-center p-0">
                    <div class="col-lg-12 col-12 p-0">
                        <p class="order">Order Now</p>
                    </div>
                </div>
            </div>
        </div>

        <div class='radio' data-value="credit"><img src="https://i.imgur.com/28akQFX.jpg" width="200px" height="60px"></div>
        <div class='radio' data-value="paypal"><img src="https://i.imgur.com/5QFsx7K.jpg" width="200px" height="60px"></div>
    <#elseIf url?contains("/student/my-courses/")>
        -
    </#if>
</div>
</@c.page>