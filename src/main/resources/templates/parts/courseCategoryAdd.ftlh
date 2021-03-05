<a class="btn btn-primary m-2" data-toggle="collapse" href="#courseCategoryAdd" role="button" aria-expanded="false" aria-controls="courseCategoryAdd">
    Add course category
</a>
<div class="collapse <#if courseCategoryCategory??>show</#if>" id="courseCategoryAdd">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if courseCategory??>${courseCategory.titleKz!''}</#if>" name="titleKz" placeholder="courseCategory title kz" />
                <#if titleKzError??>
                    <div class="invalid-feedback">
                        ${titleKzError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(titleRuError??)?string('is-invalid','')}"
                       value="<#if courseCategory??>${courseCategory.titleRu!''}</#if>" name="titleRu" placeholder="courseCategory title ru" />
                <#if titleRuError??>
                    <div class="invalid-feedback">
                        ${titleRuError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(titleEnError??)?string('is-invalid','')}"
                       value="<#if courseCategory??>${courseCategory.titleEn!''}</#if>" name="titleEn" placeholder="courseCategory title en" />
                <#if titleEnError??>
                    <div class="invalid-feedback">
                        ${titleEnError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="number" class="form-control"
                       value="<#if courseCategory??>${courseCategory.price?c}</#if>" name="tag" placeholder="courseCategory price" />
                <#if priceError??>
                    <div class="invalid-feedback">
                        ${priceError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="photoPath" id="customFile">
                    <label class="custom-file-label" for="customFile">courseCategory photo</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if courseCategory??>${courseCategory.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
