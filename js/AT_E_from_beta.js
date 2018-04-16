/**
 *  Returns energy per nucleon of particle with relativistic speed beta
 *
 * @param[in]  n                        number of particles
 * @param[in]  beta                     vector of relative particle speed beta = v/c (array of size n)
 * @param[out] E_MeV_u                  vector of energies of particle per nucleon [MeV] (array of size n)
 * @return     status code
 *
 * C declaration: int AT_E_from_beta( const long n, const double beta[], double E_MeV_u[]);
 *
 * JS:
 * in: beta   --   array of numbers
*/
function AT_E_from_beta(beta) {
    at_e_from_beta_wrap = Module.cwrap('AT_E_from_beta', 'number', ['number', 'array', 'number']);

    var beta = new Float64Array(beta);
    var uBetaArray = new Uint8Array(beta.buffer);

    var ptr = Module._malloc(beta.length);
    var statusCode = at_e_from_beta_wrap(beta.length, uBetaArray, ptr);

    var foo = [];

    for (var i=0; i<v1.length; i++)
    {
        var val = Module.getValue(ptr+i*beta.BYTES_PER_ELEMENT, 'double');
        console.log(val);
        foo.push(val)
    }

    Module._free(ptr, beta.length);
    return foo;
}