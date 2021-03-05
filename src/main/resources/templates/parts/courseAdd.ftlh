<a class="btn btn-primary m-2" data-toggle="collapse" href="#courseAdd" role="button" aria-expanded="false" aria-controls="courseAdd">
    Add course
</a>
<div class="collapse <#if course??>show</#if>" id="courseAdd">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if course??>${course.titleKz!''}</#if>" name="titleKz" placeholder="Course title kz" />
                <#if titleKzError??>
                    <div class="invalid-feedback">
                        ${titleKzError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(titleRuError??)?string('is-invalid','')}"
                       value="<#if course??>${course.titleRu!''}</#if>" name="titleRu" placeholder="Course title ru" />
                <#if titleRuError??>
                    <div class="invalid-feedback">
                        ${titleRuError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(titleEnError??)?string('is-invalid','')}"
                       value="<#if course??>${course.titleEn!''}</#if>" name="titleEn" placeholder="Course title en" />
                <#if titleEnError??>
                    <div class="invalid-feedback">
                        ${titleEnError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="number" class="form-control"
                       value="<#if course??>${course.price?c}</#if>" name="tag" placeholder="Course price" />
                <#if priceError??>
                    <div class="invalid-feedback">
                        ${priceError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="photoPath" id="customFile">
                    <label class="custom-file-label" for="customFile">Course photo</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if course??>${course.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
