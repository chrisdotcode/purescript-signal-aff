'use strict';

exports["unwrap'Impl"] = function unwrapQuoteImpl(pure) {
	return function(mapM_) {
		return function(sig) {
			var out;

			map(function(a) {
				out = constant(pure(a));
			}, sig.get());

			sig.subscribe(function(val) {
				out.set(pure(val));
			});

			return out;
		};
	};
};
