<#import "parts/common.ftlh" as c>
<@c.page>
<div class="container mt-5">
    <h3>${userChannel.username}</h3>
    <#if !isCurrentUser>
        <#if isSubscriber>
            <a class="btn btn-info" href="/unsubscribe/${userChannel.id?c}">Unsubscribe</a>
        <#else>
            <a class="btn btn-info" href="/subscribe/${userChannel.id?c}">Subscribe</a>
        </#if>
    </#if>
    <div class="container my-3">
        <div class="row my-2">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscriptions</div>
                        <h3 class="card-text">
                            <a href="/subscriptions/${userChannel.id?c}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscribers</div>
                        <h3 class="card-text">
                            <a href="/subscribers/${userChannel.id?c}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-2">
            <div class="col">
                <div class="card">
                    <div class="card-header">Studying courses</div>
                    <div class="card-body">
                        <h3 class="card-text">
                            <a href="/subscriptions/${userChannel.id?c}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Сompleted courses</div>
                    <div class="card-body">
                        <h3 class="card-text">
                            <a href="/subscribers/${userChannel.id?c}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Incompleted courses</div>
                    <div class="card-body">
                        <h3 class="card-text">
                            <a href="/subscribers/${userChannel.id?c}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "parts/messageList.ftlh"/>
</div>
</@c.page>