
export type Handle = {
}

------------------ Action
export type ActionBase = {
}


------------------ Packages
export type PackageList = {
    New:()->PackageList;
    Add:(self:PackageList,...string)->();
    Has:(self:PackageList,...string)->boolean;
    Remote:(self:PackageList,...string)->();
    Merge:(self:PackageList,with:PackageList)->();
}
export type Package = {
    PackageList:PackageList;
    Options:{any};
    Handles:{Handle};

    Finalize:(self:Package)->();
    Name:(self:Package,name:string)->Package;
    Handle:(self:Package,name:string)->Handle;
}

------------------ Props
export type Prop<T> = typeof(setmetatable(
  {} :: {T:T}, {} :: PropImpl<T>
))
export type PropHandle<T> = {
    HandleShared: {any};
    OnData: (T)->(...unknown);
    OnDataEnd: ()->(...unknown);
    -- AddAction
}
export type PropImpl<T> = {
  __call: (self: Prop<T>, val: T) -> (Prop<T>);
  __index: PropImpl<T>;

  Handle: (self: Prop<T>,handle:(PropHandle<T>)->(...any)) -> (Prop<T>);
}

------------------ Utility::StringAction
export type StringActionQueueExtend<Extend> = {
    --[=[
        The string whose occurrences of the given pattern shall be replaced.

        Returns a copy of s in which all or the first n occurrences of the pattern are replaced with the given replacement. The second value returned is the total number of substitutions made.
    ]=]
    grub: (self: Extend, string, ((string) -> string) | string | { [string]: string }, number?)
          -> Extend;

    --[=[
        Returns a string that is the concatenation of n copies of the string s.
    ]=]
    rep: (self: Extend, number) -> Extend;

    --[=[
        Returns a string that is the string s reversed.
    ]=]
    reverse: (self: Extend) -> Extend;

    --[=[
        Returns a copy of a string with all lowercase letters changed to uppercase.
    ]=]
    upper: (self: Extend) -> Extend;

    --[=[
        Returns a copy of a string with all uppercase letters changed to lowercase.
    ]=]
    lower: (self: Extend) -> Extend;

    --[=[
        Returns a formatted version of its variable number of arguments following the description given in its first argument, which must be a string.
    ]=]
    format: (self: Extend, ...any) -> Extend;

    --[=[
        Returns the substring of s that starts at i and continues until j. i and j can be negative. i defaults to 1 and j defaults to -1.
    ]=]
    sub: (self: Extend, number, number?) -> Extend;

    --[=[
        Remove indent from input, If no option, just auto detect by first line. consider first line as not indented
    ]=]
    StripIndent: (self: Extend, indent:string?, length:number?)-> Extend;

    --[=[
        Concat strings with delimiter
    ]=]
    ConcatWith: (self:Extend, delimiter:string)-> Extend;

    --[=[
        Select concat
    ]=]

    --[=[
        Push an string to buffer
    ]=]
    Push: (self: Extend, ...string) -> Extend;
    Compile: (self: Extend) -> string;
    _actions: { {any} };
    _strings: { string };
}
export type StringActionQueue = StringActionQueueExtend<StringActionQueue>

return {}
