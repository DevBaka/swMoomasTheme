{extends file="parent:frontend/listing/text.tpl"}

{* Categorie headline *}
{block name="frontend_listing_text"}
    {if $sCategoryContent.cmsheadline || $sCategoryContent.cmstext}
        <div class="hero-unit category--teaser panel has--border is--rounded">

            {* Category text *}
            {block name="frontend_listing_text_content"}
                <div class="hero--text panel--body is--wide">
                    {if $sCategoryContent.cmstext}

                        {block name="frontend_listing_text_content_offcanvas"}
                            <div class="teaser--text-offcanvas is--hidden">

                                {* Close Button *}
                                {block name="frontend_listing_text_content_offcanvas_close"}
                                    <a href="#" title="{"{s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}"|escape}" class="close--off-canvas">
                                        <i class="icon--arrow-left"></i> {s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}
                                    </a>
                                {/block}
                                {* Off Canvas Content *}
                                {block name="frontend_listing_text_content_offcanvas_content"}
                                    <div class="offcanvas--content">
                                        <div class="content--title">{$sCategoryContent.cmsheadline}</div>
                                        {$sCategoryContent.cmstext}|BAKA
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    {/if}
                </div>
            {/block}
        </div>
    {/if}
{/block}