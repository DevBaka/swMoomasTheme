{extends file="parent:frontend/index/index.tpl"}
{* Maincategories navigation top *}
{block name='frontend_index_navigation_categories_top'}
    <nav class="navigation-main"{if $theme.scrollNav} data-scroll-nav="true" data-showPosition="600"{/if}>
        <div class="container" data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
            {block name="frontend_index_navigation_categories_top_include"}
                {include file='frontend/index/main-navigation.tpl'}
            {/block}
        </div>
    </nav>
{/block}