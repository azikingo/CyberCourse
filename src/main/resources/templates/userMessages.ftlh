<#import "parts/common.ftlh" as c>
<@c.page>
<div class="container mt-5">
    <h3>${userChannel.username}</h3>
    <#if !isCurrentUser>
        <#if isSubscriber>
            <a class="btn btn-info" href="/unsubscribe/${userChannel.id?c}"> <#if .locale = 'kz'>
                   Курстан шығу
                <#elseIf .locale = 'ru'>
                    Отписаться
                <#else>
                    Unsubscribe
                </#if> </a>
        <#else>
            <a class="btn btn-info" href="/subscribe/${userChannel.id?c}"><#if .locale = 'kz'>
                    Курсқа кіру
                <#elseIf .locale = 'ru'>
                    Подписаться
                <#else>
                    Subscribe
                </#if></a>
        </#if>
    </#if>
    <div class="container my-3">
        <div class="row my-2">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">S<#if .locale = 'kz'>
                           Тіркелген курстар
                        <#elseIf .locale = 'ru'>
                           Подписки
                        <#else>
                            Subscriptions
                            </#if></div>
                        <h3 class="card-text">
                            <a href="/subscriptions/${userChannel.id?c}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><#if .locale = 'kz'>
                                Подписьчиктер
                            <#elseIf .locale = 'ru'>
                                Подписьчики
                            <#else>
                                Subscribers
                            </#if></div>
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
                    <div class="card-header"><#if .locale = 'kz'>
                            Оқып жатқан курстар
                        <#elseIf .locale = 'ru'>
                            Изучаемые курсы
                        <#else>
                            Studying courses
                        </#if></div>
                    <div class="card-body">
                        <h3 class="card-text">
                            <a href="/subscriptions/${userChannel.id?c}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header"><#if .locale = 'kz'>
                            Бітірген курстар
                        <#elseIf .locale = 'ru'>
                           Оконченные курсы
                        <#else>
                            Completed courses
                        </#if></div>
                    <div class="card-body">
                        <h3 class="card-text">
                            <a href="/subscribers/${userChannel.id?c}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header"><#if .locale = 'kz'>
                            Бітпеген курстар
                        <#elseIf .locale = 'ru'>
                            Неоконченные курсы
                        <#else>
                            Incompleted courses
                        </#if></div>
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