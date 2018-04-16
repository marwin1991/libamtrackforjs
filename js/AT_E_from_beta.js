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

    var data= new Float64Array(beta);
    var nDataBytes = data.length * data.BYTES_PER_ELEMENT;

    var dataPtr = Module._malloc(nDataBytes);

    var dataHeap = new Uint8Array(Module.HEAPF64.buffer, dataPtr, nDataBytes);
    dataHeap.set(new Uint8Array(data.buffer));

    at_e_from_beta_wrap(data.length, new Uint8Array(data.buffer), dataHeap.byteOffset);
    var result = new Float64Array(dataHeap.buffer, dataHeap.byteOffset, data.length);

    Module._free(dataHeap.byteOffset);
    return result;
}