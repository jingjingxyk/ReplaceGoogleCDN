let app = () => {

    setTimeout(()=>{

        // 某个需要被监控的 dom 元素。

        var targetNode = document.querySelector('#extension_id');

        //配置 dom 的哪些改变会触发回调函数，详细见下文表格。
        var mutationObserverInitConfig = {attributes: true, childList: true, subtree: true};
        //var mutationObserverInitConfig = { childList: true, subtree: true };

        // dom 变化时触发的回调函数，传入 mutationsList：记录 dom 变化的对象数组。
        var callback = function (mutationsList) {
            for (let  mutation of mutationsList) {
                console.log(mutation)
                if (mutation.type === 'childList' && mutation.target.getAttribute("class") === "be-pager") {

                }
            }
        }

        // 创建一个 MutationObserver 示例，传入回调函数
        let  observer = new MutationObserver(callback);

        // 注册监控的节点、监控的事件
        observer.observe(targetNode, mutationObserverInitConfig);

        // 停止监控
        // observer.disconnect();
        let extension_info=document.querySelector('#extension_id').value
        extension_info=JSON.parse(extension_info)
        console.log(extension_info)

        chrome.runtime.sendMessage(extension_info.extenions_id, {
            "action": 'set_rule_auth',
            "content": {},
            "namespace": 'jingjingxyk_redirect'
        }, function (response) {
            console.log(response);
            if (response && response.code === 200 && response.data) {
                console.log(response.data)

                observer.disconnect();
            }

        });


    },5000)

}
export default app
