function [ output ] = reorderDatagram (a,b,c,d,e)
% function to reorder audios and concatenate them 
	clc;
	[ s(1).audio, s(1).frequency ] = audioread (a);
	s(1).length = length(s(1).audio);
	s(1).name = 1;
	[ s(2).audio, s(2).frequency ] = audioread (b);
	s(2).length = length(s(2).audio);
	s(2).name = 2;
	[ s(3).audio, s(3).frequency ] = audioread (c);
	s(3).length = length(s(3).audio);
	s(3).name = 3;
	[ s(4).audio, s(4).frequency ] = audioread (d);
	s(4).length = length(s(4).audio);
	s(4).name = 4;
	[ s(5).audio, s(5).frequency ] = audioread (e);
	s(5).length = length(s(5).audio);
	s(5).name = 5;

	steplength = 1260;
	stepcount = 70;
	fs = s(1).frequency; 
	%all sounds are of the same frequency
	corrmatrix = zeros (5,5);

	for k = 1:5
		for l = 1:5
			if k~=l

				maxcorr = 0;
				x = 5*fs;

				for stepindex = 1:stepcount
					corrvalue = corr2 ( abs ( fft2 ( s(k).audio ( s(k).length - x + 1 : s(k).length, 1:2 ) ) ), abs ( fft2 ( s(l).audio (1 : x, 1:2 ) ) ) );
					x = x - steplength;
					if corrvalue >= maxcorr 
						maxcorr = corrvalue;
						stepvalue(k,l) = stepindex;
					end
				end

				corrmatrix(k,l) = maxcorr;

			end
		end
	end

	%assumption : first sound is sound 3

	result(1) = 3;

	for check = 2:5
		maxcorr = 0;
		for index = 1:5
			if corrmatrix ( result(check - 1), index ) > maxcorr
				maxcorr = corrmatrix ( result(check - 1), index );
				result(check) = index;
			end
		end
	end

	output = s(result(1)).audio;

	for overlap = 2:5

		output = cat ( 1, output, s(result(overlap)).audio(stepvalue(result(overlap-1), result(overlap))*steplength+1:s(result(overlap)).length,1:2));

	end

	for index = 1:5 
		disp (result(index));
	end

	sound(output,fs);

end
