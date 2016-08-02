
[#-- Macro to render a responsive image with the variations configured in the theme.
        The values in the 'name' fields here, must be present the theme.--]
[#macro responsiveImageConfigured asset  alt="" title="" cssClass="" additional="" ]
    [#assign srcs = [
        {"name":"480-simple", "width":"480"},
        {"name":"960-simple", "width":"960"},
        {"name":"1366-simple","width":"1366"},
        {"name":"1600-simple","width":"1600"}]]

    [#assign fallback="960-simple"]

    [@responsiveImageLazySizes asset alt title cssClass srcs fallback additional /]
[/#macro]

[#-- Macro to render responsive image using lazysizes javascript library.
        Use data-srcset attribute to only load the size of image that the current image width requires --]
[#macro responsiveImageLazySizes asset  alt="" title="" cssClass="" srcs="" fallbackName="" additional="" ]
    [#if asset?exists]
        [#assign cssClass = cssClass + " lazyload"]
        [#assign rendition = damfn.getRendition(asset, fallbackName)!]
        <noscript>
            <img class="${cssClass}" src="${rendition.link}" alt="${alt}" title="${title}" ${additional} />
        </noscript>
        <img data-sizes="auto" class="${cssClass} lazyload" ${additional} src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="${alt}" title="${title}"
             data-srcset="[#compress]
                [#list srcs as src]
                    [#assign rendition = damfn.getRendition(asset, src.name)!]
                    [#if rendition?exists && rendition?has_content]
                        ${rendition.link} ${src.width}w,
                    [/#if]
                [/#list]
            [/#compress]" />
    [/#if]
[/#macro]
