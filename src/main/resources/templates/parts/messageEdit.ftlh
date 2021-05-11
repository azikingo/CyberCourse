<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Send post
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Type message" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Tag" />
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile"><#if .locale = 'kz'>
                            Файлды таңданыз
                        <#elseIf .locale = 'ru'>
                            Выберите файл
                        <#else>
                            Choose file
                        </#if></label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary"><#if .locale = 'kz'>
                        Жіберу
                    <#elseIf .locale = 'ru'>
                        Отправить
                    <#else>
                        Send
                    </#if></button>
            </div>
        </form>
    </div>
</div>
