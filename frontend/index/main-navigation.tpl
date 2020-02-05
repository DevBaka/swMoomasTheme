{extends file="parent:frontend/index/main-navigation.tpl"}



{block name='frontend_index_navigation_categories'}
    <div class="navigation--list-wrapper">
        {block name='frontend_index_navigation_categories_navigation_list'}
            <ul class="navigation--list container" role="menubar" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
                {strip}
                    {block name='frontend_index_navigation_categories_top_home'}
                        <li class="navigation--entry{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} is--active{/if} is--home" role="menuitem">
                            {block name='frontend_index_navigation_categories_top_link_home'}
                                <a class="navigation--link is--first{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}" href="{url controller='index'}" title="!!!{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}" aria-label="{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}" itemprop="url">
                                    <span itemprop="name">{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}</span>
                                </a>
                            {/block}
                        </li>
                    {/block}

                    {block name='frontend_index_navigation_categories_top_before'}{/block}

                    {assign "Kategories" []}
                    {foreach $sCategories as  $sCategory}
                        {*foreach from=$sCategories|@sort item=sCategory*}
                        {*$Kategories += $sCategory['name']*}
                        {append 'Kategories' value=$sCategory['name'] index=$sCategory['id']}
                    {/foreach}


                    {foreach $Kategories|@sort as $name}
                        {foreach from=$Kategories key='k' item='i'}
                            {if $i == $name}
                                {assign var='key' value=$k}
                            {/if}
                        {/foreach}
                            {*if !$sCategories[$key]['flag']*}
                                <li class="navigation--entry{if $sCategories[$key]['flag']} is--active{/if}" role="menuitem">
                                    <a class="navigation--link{if $sCategories[$key]['flag']} is--active{/if}" href="{$sCategories[$key]['link']}" title="{$Kategories[$key]}" aria-label="{$Kategories[$key]}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                                        <span itemprop="name">{$Kategories[$key]}</span>
                                    </a>
                                </li>
                            {*/if*}
                        {/foreach}



                    {*foreach $sMainCategories|@sort as $sCategory}
                        {block name='frontend_index_navigation_categories_top_entry'}
                            {if !$sCategory.hideTop}
                                <li class="navigation--entry{if $sCategory.flag} is--active{/if}" role="menuitem">
                                    {block name='frontend_index_navigation_categories_top_link'}
                                        <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}!!" aria-label="{$sCategory.description}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                                            <span itemprop="name">{$sCategory.description}!!!</span>
                                        </a>
                                    {/block}
                                </li>
                            {/if}
                        {/block}
                    {/foreach*}
                    {block name='frontend_index_navigation_categories_top_after'}{/block}
                {/strip}
            </ul>
        {/block}
    </div>
{/block}
