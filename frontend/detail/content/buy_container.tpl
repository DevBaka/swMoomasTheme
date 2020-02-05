{extends file='parent:frontend/detail/content/buy_container.tpl'}

{block name='frontend_detail_data_ordernumber_content'}

    {*$smarty.block.parent*}
    
    {*debug*}
    {*$_foo = $sCategories|sort:$smarty.const.SORT_LOCALE_STRING*}
    
    {assign "Kategories" []}

    <ul class="ulContainer">
        some array: <br>
        {*foreach $sCategories as $sCategory*}
        {*foreach $sCategories|@sort as $sCategory*}
        {foreach $sCategories as  $sCategory}
        {*foreach from=$sCategories|@sort item=sCategory*}
            {*$Kategories += $sCategory['name']*} 
            {append 'Kategories' value=$sCategory['name'] index=$sCategory['id']}
            <li>  {$sCategory['name']}</li>
        {/foreach}
        
        <br><hr>
        {*foreach $Kategories|@sort as $name*}
        {foreach $Kategories|@sort as $name}
            {foreach from=$Kategories key='k' item='i'}
                {if $i == $name}
                    {assign var='key' value=$k}
                {/if}
            {/foreach}
            <li>{$name} | ID: {$key}-{$Kategories[$key]} <br>link: <a href="{$sCategories[$key]['link']}">{$Kategories[$key]}</a> </li>
        {/foreach}
        <br><hr>
        SKategories:
        {*$sCategories|print_r*}
        <br><hr>
        Kategories
        {*$Kategories|print_r*}
        <br><hr>
    </ul>

{/block}
