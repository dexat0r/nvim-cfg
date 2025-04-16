local status, ts_error_translator = pcall(require, "ts-error-translator")

if (status) then
    ts_error_translator.setup()
end
