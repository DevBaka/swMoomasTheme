{extends file="parent:frontend/listing/index.tpl"}

{* Main content *}
{block name='frontend_index_content'}
    <div class="content listing--content">

        {* Banner *}
        {block name="frontend_listing_index_banner"}
            {if !$hasEmotion}
                {include file='frontend/listing/banner.tpl'}
            {/if}
        {/block}

        {if $sCategoryContent.cmsheadline || $sCategoryContent.cmstext}
            <div class="hero-unit category--teaser panel has--border is--rounded">
                {* Headline *}
                {block name="frontend_listing_text_headline"}
                    {if $sCategoryContent.cmsheadline}
                        <h1 class="hero--headline panel--title">{$sCategoryContent.cmsheadline}</h1>
                    {/if}

                    <div class="seo_einleitungstext">
                        {$sCategoryContent.attribute.bfb_seo_einleitungstext}
                    </div>


                    {if $sCategories.bfb_seo_einleitungstext}
                        {s name="DetailAttributeField3Label" namespace="frontend/detail/index"}Artikel{/s}:
                        {$sCategories.bfb_seo_einleitungstext|escape}
                    {/if}

                {/block}
            </div>
        {/if}

        {* Topseller *}
        {block name="frontend_listing_index_topseller"}
            {if !$hasEmotion && {config name=topSellerActive}}
                {action module=widgets controller=listing action=top_seller sCategory=$sCategoryContent.id}
            {/if}
        {/block}

        {* Define all necessary template variables for the listing *}
        {block name="frontend_listing_index_layout_variables"}

            {$emotionViewports = [0 => 'xl', 1 => 'l', 2 => 'm', 3 => 's', 4 => 'xs']}

            {* Count of available product pages *}
            {$pages = 1}

            {if $criteria}
                {$pages = ceil($sNumberArticles / $criteria->getLimit())}
            {/if}

            {* Layout for the product boxes *}
            {$productBoxLayout = 'basic'}

            {if $sCategoryContent.productBoxLayout !== null && $sCategoryContent.productBoxLayout !== 'extend'}
                {$productBoxLayout = $sCategoryContent.productBoxLayout}
            {/if}
        {/block}

        {* Listing *}
        {block name="frontend_listing_index_listing"}
            {include file='frontend/listing/listing.tpl'}

            <div class="hero-unit category--teaser panel has--border is--rounded">
                <div class="hero--text panel--body is--wide">
                    {if $sCategoryContent.cmstext}
                        <div class="teaser--text-long">
                            {$sCategoryContent.cmstext} Baka3!
                        </div>
                        <div class="teaser--text-short is--hidden">
                            {$sCategoryContent.cmstext|strip_tags|truncate:200}
                            <a href="#" title="{"{s namespace="frontend/listing/listing" name="ListingActionsOpenOffCanvas"}{/s}"|escape}" class="text--offcanvas-link">
                                {s namespace="frontend/listing/listing" name="ListingActionsOpenOffCanvas"}{/s} &raquo;
                            </a>
                        </div>
                        <div class="teaser--text-offcanvas is--hidden">
                            <a href="#" title="{"{s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}"|escape}" class="close--off-canvas">
                                <i class="icon--arrow-left"></i> {s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}
                            </a>
                            <div class="offcanvas--content">
                                <div class="content--title">{$sCategoryContent.cmsHeadline}Bak3!</div>
                                {$sCategoryContent.cmstext}Baka3!
                            </div>
                        </div>
                    {/if}
                </div>
            </div>

        {/block}

        {* Tagcloud *}
        {block name="frontend_listing_index_tagcloud"}
            {if {config name=show namespace=TagCloud }}
                {action module=widgets controller=listing action=tag_cloud sController=listing sCategory=$sCategoryContent.id}
            {/if}
        {/block}

        {* Category headline *}
        {block name="frontend_listing_index_text"}
            {if !$hasEmotion}
                {include file='frontend/listing/text.tpl'}
            {/if}
        {/block}

    </div>
{/block}