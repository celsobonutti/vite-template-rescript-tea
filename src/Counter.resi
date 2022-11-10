open Tea.App

type msg

type model

let init: unit => model

let update: (model, msg) => model

let viewButton: (~title: string, ~disabled: bool=?, ~msg: msg, unit) => Vdom.t<msg>

let view: model => Vdom.t<msg>

let main: (Js.null_undefined<Dom.node>, unit) => Tea.App.programInterface<msg>
