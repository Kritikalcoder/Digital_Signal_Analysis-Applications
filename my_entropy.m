function [ output ] = my_entropy ( image1 )
	p = imhist ( image1 );
	ent = 0;
	p ( p == 0 ) = [];
	s = size ( p );
	s = s (1);
	if ( s > 0 )
		sum = 0;
		for index = 1 : s
			sum = sum + p ( index );
		end
		if ( sum > 0 )
			p = p / sum;
			plog = log2 (p);
			for index = 1 : s
				ent = ent + p ( index , 1 ) * plog ( index , 1 );
			end
		end
	end
	output = -1 * ent;
end