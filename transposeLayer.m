classdef transposeLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)
% 重命名为transposeLayer
% 维度转置
    properties
        % (Optional) Layer properties.

        % Declare layer properties here.
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.
        Weights
        % Declare learnable parameters here.
    end

    methods
        function layer = transposeLayer(numInputs)
        %%重命名层名
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.
            layer.Name = "transpose";
            %%层说明，会在分析的时候显示
            layer.Description = "Transpose";
            layer.Weights = rand(numInputs,1);

            % Define layer constructor function here.
        end
%         function Z = forward(layer,X)
%             W = layer.Weights;
%             [x,y,z] = size(X);
%             Z = zeros(z,x,y);
%             for i = 1:z
%                 Z(i,:,:) = X(:,:,i); 
%             end
%             Z = dlarray(Z);
%             Z = W .* Z;
%         end
        function [Z] = predict(layer,varargin)
            X = varargin;
            W = layer.Weights;
            X1 = X{1};
            [x,y,z] = size(X1);
            Z1 = zeros(z,x,y);
%             sz = size(X1);
%             Z1 = zeros(sz,'like',X1);
            for i = 1:z
                Z1(i,:,:) = X1(:,:,i); 
            end
            Z1 = dlarray(Z1);
            X{1} = Z1;
%             Z = W .* Z;
            for i = 1:layer.NumInputs
                Z = W(i)*X{i};
            end
        end

       
    end
end