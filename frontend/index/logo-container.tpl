{extends file="parent:frontend/index/logo-container.tpl"}

{block name="frontend_index_logo"}
    {$smarty.block.parent}
    {if $theme.themeSlogan}
        <div class="shop-slogan block">
            {$theme.themeSlogan}
        </div>
    {/if}
{/block}