import { ResponsError } from "../Error/response-error.js";

export const validate = (schema, request) => {
    const kekka = schema.validate(request);
    if (kekka.error) {
        throw new ResponsError(400, kekka.error.message);
    } else {
        return kekka.value;

    }

}
